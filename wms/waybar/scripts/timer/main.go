package main

import (
	"bufio"
	"encoding/json"
	"fmt"
	"log"
	"os"
	"os/exec"
	"runtime"
	"strconv"
	"syscall"
	"time"
)

type waybar_output struct {
	Text    string `json:"text"`
	Alt     string `json:"alt"`
	Tooltip string `json:"tooltip"`
	Class   string `json:"class"`
}
type timer_state struct {
	Duration time.Duration
	Pause    bool
	Start    time.Time
	End      time.Time
	date     time.Time
}

const (
	syscall_start syscall.Signal = syscall.SIGUSR1
	syscall_stop  syscall.Signal = syscall.SIGUSR2

	root       string = "/home/illumiko/dotfiles/wms/waybar/scripts/go_timer/"
	cmd_file   string = root + "cmd"
	out_file   string = root + "out"
	logbook    string = "logbook.json"
	permission uint32 = 0644
)

func ensure_fifo(path string) error {
	_, err := os.Stat(path)
	// if err != nil {
	// 	return fmt.Errorf("%w", err)
	// }
	if os.IsNotExist(err) {
		err = syscall.Mkfifo(path, permission)
		if err != nil {
			return fmt.Errorf("mkfifo failed %w", err)
		}
	}
	return nil
}

func output_helper(s string) {

	err := ensure_fifo(out_file)
	if err != nil {
		log.Fatalf("error creating fifo %v", err)
	}
	// writer := bufio.NewWriter(os.Stdout)
	// j := waybar_output{s, "", "", ""}
	// jout, err := json.Marshal(j)
	// if err != nil {
	// 	fmt.Println(err)
	// }
	//
	// fmt.Fprint(os.Stdout, string(jout)+"\n")
	// writer.Flush()
	// fmt.Println(s)
	// os.Stdout.Sync()
	file, err := os.OpenFile(out_file, os.O_CREATE|os.O_TRUNC|os.O_RDWR, 0644)
	if err != nil {
		log.Fatalf("error opening file %v", err)
	}
	// _, err = file.Seek(0, 0)
	// if err != nil {
	// 	log.Fatalf("error seeking to 0 %v", err)
	// }
	// err = file.Truncate(0)
	// if err != nil {
	// 	log.Fatalf("error truncate to 0 %v", err)
	// }
	s = s+ "\n"
	_, err = file.WriteString(s)
	if err != nil {
		log.Printf("Error writing to file: %v", err)
		return
	}
	defer file.Close()
}

func reading_fifo(sig chan string) {
	err := ensure_fifo(cmd_file)
	if err != nil {
		log.Fatalf("error creating fifo %v", err)
	}
	for {
		fifo, err := os.OpenFile(cmd_file, os.O_RDONLY, os.ModeNamedPipe)
		if err != nil {
			log.Fatalf("error opening file %v", err)
		}

		scanner := bufio.NewScanner(fifo)
		for scanner.Scan() {
			// log.Printf("received %s", scanner.Text())
			sig <- scanner.Text()
		}
		if err := scanner.Err(); err != nil {
			log.Fatalf("error opening file %v", err)
		}
	}

}

func writeState(t timer_state) {
	format := struct {
		Duration time.Duration
		Pause    bool
		Start    string
		End      string
		Date     string
	}{
		Duration: time.Duration(t.Duration.Minutes()),
		Pause:    t.Pause,
		Start:    t.Start.Format(time.Kitchen),
		End:      t.End.Format(time.Kitchen),
		Date:     t.date.Format(time.DateOnly)}
	f, err := os.OpenFile(logbook, os.O_APPEND|os.O_CREATE|os.O_WRONLY, 0644)
	if err != nil {
		log.Fatalf("%s failed to open %v", logbook, err)
	}
	defer f.Close()
	json.NewEncoder(f).Encode(format)
}

func start_timer(duration time.Duration, state *timer_state, s chan string) {
	switch state.Pause {
	case false:
		output_helper("clock is already running")
	case true:
		state.Start = time.Now()
		state.Pause = false
		end := state.Start.Add(duration * time.Minute)
		for {
			elapsed_time := time.Until(end).Round(time.Second)
			output_helper(elapsed_time.String())
			select {
			// case <-s:
			case s := <-s:
				if s == "pause" {
					state.Pause = true
					state.End = time.Now()
					state.Duration = time.Since(state.Start)
					writeState(*state)
					output_helper("Online")
					output_helper("Online")
					return
				}
			default:
				if elapsed_time == 0 {
					state.Pause = true
					state.End = time.Now()
					state.Duration = state.Start.Sub(end)
					writeState(*state)
					if runtime.GOOS == "linux" {
						cmd := exec.Command("paplay", root+"alarm.mp3")
						cmd.Run()
					}
					output_helper("Online")
					return
				}
			}
			time.Sleep(time.Second)
		}
	}

}

func main() {
	output_helper("Online")
	output_helper("Online")
	clock := timer_state{0, true, time.Now(), time.Now(), time.Now()}
	sig := make(chan string, 1)
	go reading_fifo(sig)
	for {
		select {
		case s := <-sig:
			switch len(s) {
			case 2:
				duration, _ := strconv.Atoi(s)
				start_timer(time.Duration(duration), &clock, sig)
			default:
				fmt.Println("wrong cmd")
			}
		}

		output_helper("bye")
		// select {
		// case s := <-sig:
		// 	switch s {
		// 	case syscall_start:
		// 		go start_timer(1, &clock, sig)
		// 		fmt.Println("listenned")
		// 	}
		// }
	}

}
