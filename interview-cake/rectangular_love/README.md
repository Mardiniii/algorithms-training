Write a method to find the rectangular intersection of two given love rectangles.

As with the example above, love rectangles are always "straight" and never "diagonal." More rigorously: each side is parallel with either the x-axis or the y-axis.

They are defined as hashes like this:

```ruby
my_rectangle = {
  # Coordinates of bottom-left corner
  left_x: 1,
  bottom_y: 1,

  # Width and height
  width: 6,
  height: 3
}
```

Your output rectangle should use this format as well.
