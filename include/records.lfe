(defrecord roz-monster
  (id '())
  (nick '())
  (first '())
  (last '())
  (org '()))

(defrecord roz-comment
  (id '())
  (time-stamp '())
  (type '())
  (source '())
  (content '()))

(defrecord roz-rating
  (id '())
  (created '())
  (updated '())
  value)

(defrecord roz-group
  (id '())
  (name '()))

(defrecord roz-team
  (id '())
  (name '()))

(defrecord roz-product
  (id '())
  (name '()))

(defrecord roz-input
  (id '())
  (name '()))

(defrecord roz-output
  (id '())
  (name '()))

(defrecord comment-link
  monster-id
  comment-id)

(defrecord rating-link
  monster-id
  rating-id)

(defrecord group-link
  monster-id
  group-id)

(defrecord team-link
  monster-id
  team-id)

(defrecord product-link
  monster-id
  product-id)

(defrecord output-link
  product-id
  output-id)

(defrecord input-link
  product-id
  input-id)
