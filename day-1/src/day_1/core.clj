(ns day-1.core
  (:gen-class)
  (:require [clojure.java.io :as io]
            [clojure.string :as str]))

(defn parse-rotation [rotation]
  (when-not (str/blank? rotation)
    {:direction (first rotation)
     :steps (Integer/parseInt (subs rotation 1))}))

(defn rotate-dial [position {:keys [direction steps]}]
  (mod ((if (= direction \R) + -) position steps) 100))

(defn count-zero-passes [position {:keys [direction steps]}]
  (quot (if (or (= direction \R) (= position 0))
          (+ position steps)
          (+ (- 100 position) steps))
        100))

(defn process-rotations [rotations initial-position]
  (->> rotations
       (remove str/blank?)
       (map parse-rotation)
       (reduce (fn [[pos count] rotation]
                 (let [new-pos (rotate-dial pos rotation)
                       passes (count-zero-passes pos rotation)]
                   [new-pos (+ count passes)]))
               [initial-position 0])
       second))

(defn -main []
  (with-open [rdr (io/reader "data/input.txt")]
    (println (process-rotations (line-seq rdr) 50))))