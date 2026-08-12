package main

import (
	"fmt"
	"net/http"
	"encoding/json"
	"time"

	"github.com/prometheus/client_golang/prometheus"
	"github.com/prometheus/client_golang/prometheus/promhttp"
	"github.com/prometheus/client_golang/prometheus/promauto"
)

type Answer struct {
    Name    string `json:"nome"`
    Time    string `json:"horario"`
}

var metrics = promauto.NewCounterVec (
	prometheus.CounterOpts {
		Name: "http_requests_total",
	},
	[]string{"code","method"},
)

func handlerFunc(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Content-Type", "application/json")

	formattedTime := time.Now().UTC().Format(time.RFC3339)

	response := Answer {
		Name: "Projeto Korp",
		Time: formattedTime,
	}

	json.NewEncoder(w).Encode(response)
}

func main () {
	process := promhttp.InstrumentHandlerCounter(metrics, http.HandlerFunc(handlerFunc))
	http.Handle("/projeto-korp", process)
	http.Handle("/metrics", promhttp.Handler())

	fmt.Println("Server is running at http://localhost:8080/projeto-korp")
	fmt.Println("Metrics available at http://localhost:8080/metrics")
	
	err := http.ListenAndServe(":8080", nil)
	if err != nil {
		fmt.Printf("Error: %v\n", err)
	}
}
