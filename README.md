# Albert Challenge iOS App
#### Tae Hong Min
### Use Cases
  - User can go search for book title, author, etc.
  - User can save any books they want onto the wishlist
  - User can see their wishlist repository
  - User can delete from the wishlist
  - User can tap on a book from the list and see a detailed view
  - User will not be able to add item they already added to wishlist if it is the same item
  - User can decide to search for a title or an author

### Future Implementations given time (Upon Testing)
  - Keep track of URLSessions to not clog request calls and default a timeout that could crash the app
  - Filter and sorting in the tableviews
  - Display on UI that book is already in the wishlist
  - Do further data mining and get better useful data
  - Optimize NSConstraint anchor layout
  - Most definitely should use a progress bar next time
  
### What I used
  - Realm
  - SwiftyJSON
  - URLSessions
  - Programmatic UI (No storyboards)


### Notes
  - using the q= filter which is the "all" filter doesn't make sense becuase the raw data passing through gives unsorted irrelevant results. Without some data analysis it doesn't seem possible to rank the best ones
  - Thus, I added filter to search for Title/Author for now

https://github.com/noctisilva/Paper