(defrecord roz-monster
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
  group-name
  ignored)

(defrecord roz-team
  team-name
  ignored)

(defrecord roz-product
  product-name
  ignored)

(defrecord roz-input
  input-name
  ignored)

(defrecord roz-output
  output-name
  ignored)

(defrecord comment-link
  monster-nick
  comment-id)

(defrecord rating-link
  monster-nick
  rating-id)

(defrecord group-link
  monster-nick
  group-name)

(defrecord team-link
  monster-nick
  team-name)

(defrecord product-link
  monster-nick
  product-name)

(defrecord output-link
  product-name
  output-name)

(defrecord input-link
  product-nick
  input-name)
