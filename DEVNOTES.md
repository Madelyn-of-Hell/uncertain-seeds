# DEVNOTES

#### Platforming
- Every floor surface needs to collide on layers 1 and 2. This is because the player collides on layer one, and the friction ray collides on level 2.
- Every floor surface must have friction as a property. For safe measure, pretty much every StaticBody2D should probably have a friction value, even if it's just 'none'
