; clojure notes
(defn greet [name]
  (str "hello " name))

(println (greet "practice"))

(def nums [1 2 3])
(def doubled (map #(* % 2) nums))
(println doubled)

; TODO: try macros next
