(defrecord roz-monster
  id 
  (first '())
  (last '())
  (org '()))

(defrecord roz-comment
  id
  (time-stamp '())
  (type '())
  (source '())
  (content '()))

(defrecord roz-rating
  id
  (created '())
  (updated '())
  value)

(defrecord roz-group
  id
  (name '()))

(defrecord roz-team
  id
  (name '()))

(defrecord roz-product
  id
  (name '()))

(defrecord roz-input
  id
  (name '()))

(defrecord roz-output
  id
  (name '()))

