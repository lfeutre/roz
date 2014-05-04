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

(defrecord roz-comment-link
  monster-nick
  comment-id)

(defrecord roz-rating-link
  monster-nick
  rating-id)

(defrecord roz-group-link
  monster-nick
  group-name)

(defrecord roz-team-link
  monster-nick
  team-name)

(defrecord roz-product-link
  monster-nick
  product-name)

(defrecord roz-output-link
  product-name
  output-name)

(defrecord roz-input-link
  product-nick
  input-name)
