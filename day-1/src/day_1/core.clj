(ns day-1.core
  (:gen-class)
  (:require [clojure.java.io :as io]))


(defn rotate-dial [current_position rotation]
  (let [[direction & steps] rotation]
    (if (= direction \R)
      (mod (+ current_position (Integer/parseInt (apply str steps))) 100)
      (mod (- current_position (Integer/parseInt (apply str steps))) 100))))


(defn process-lines [lines current_position current_count]
  (if (or (empty? lines) (= (first lines) "") )
    current_count
    (let [[head & rest] lines
          new_current_position (rotate-dial current_position head)]
      (recur rest new_current_position  (if (== new_current_position 0) (+ current_count 1) current_count)))))

(defn -main []
  (with-open [rdr (io/reader "data/input.txt")]
    (println (process-lines (line-seq rdr) 50 0))))



