import Foundation

// For this homework project, we'll be connecting to the "TLDR" server
// to add a few books. The first thing you need to do is create an object
// that we'll upload to the server.

// MARK: - STEP ONE

// Implement a struct that defines a book. A book consists of the following
// items:
// A title, which is a string
// An author, which is a string
// The publication year, as a string (because dates are hard)
// A string for the URL for an image for the book cover

//
// Remember that this structure needs to conform to the `Encodable` protocol.
// Using `Codable` more generally will be useful, as by doing this you'll
// be able to reuse this struct in Project Three.

struct Book: Codable {
  let id: Int?
  let title: String
  let author: String
  let published: String
  let imageURLString: String
}


func postBook (book: Book) {
  let urlString = "https://uofd-tldrserver-develop.vapor.cloud/books"
  let url = URL(string: urlString)!
  var urlRequest = URLRequest(url: url)

  urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
  urlRequest.httpBody = try? JSONEncoder().encode(book)
  urlRequest.httpMethod = "POST"
  
  let task = URLSession(configuration: .ephemeral).dataTask(with: urlRequest)
  task.resume()

}
                 
// MARK: - STEP TWO

// Once you've defined this structure, you'll need to define a couple of
// book objects that you can insert into the database. In order or us to
// have an amusing dataset to work with, each student is requested to
// create five different books for this database.

let bookOne = Book (
               id: nil,
               title: "Crime and Punishment", 
               author: "Fydor Dostoevsky", 
               year: "1993", 
               imageURLString: "https://prodimage.images-bn.com/pimages/9781548747329_p0_v2_s600x595.jpg")

let bookTwo = Book (
                    id: nil,
                    title: "Hunger Games",
                    author: "Suzzane Collins", 
                    year: "2008", 
                    imageURLString: "https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1447303603l/2767052.jpg")

let bookThree = Book (
               id:nil,
               title: "Life of pi", 
               author: "Yann Martel", 
               year: "2001", 
               imageURLString: "https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1320562005l/4214.jpg")

let bookFour = Book (
               id: nil,
               title: "Hacking Darwin", 
               author: "Jamie Metzl", 
               year: "2019", 
               imageURLString: "https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1548399156l/40597264.jpg")

let bookFive = Book (
               id:nil,
               title: "Einstien", 
               author: "Walter Isaacson", 
               published: "2007", 
               imageURLString: "https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1529200634l/37946247._SX318_.jpg") 
                        
// MARK: - STEP THREE

var books = [Book]()
books.append(bookOne)
books.append(bookTwo)
books.append(bookThree)
books.append(bookFour)
books.append(bookFive)

//function defined above
for bookObject in books {
  postBook (book: bookObject)
}

// Now we need to publish this data to the server.

// Create a URL to connect to the server. Its address is:
//      https://uofd-tldrserver-develop.vapor.cloud/books

// Create a URL request to publish the information, based upon the URL you
// just created.

// Add the body to the URL request you just created, by using JSONEncoder.

// Add a "Content-Type" : "application/json" header to your request, so that
// the server will properly understand the body of your request.

// Set the method of the request to "POST", because we're providing information
// rather than retrieving it.

// Create a data task for publishing this element, and kick it off with a resume().

// MARK: - HELPFUL HINTS
// You might want to create a method for publishing the data, so that you
// can effectively loop over an array of books.
//
// If you visit the URL for the service in a 'GET' request, it will return a
// list of books to you. We'll be using this list of books for Project Three.
