/*
See the License.txt file for this sample’s licensing information.
*/

import SwiftUI

/* Defining a panda struct with the Codable protocol so the response data can be serialized like JSON*/
struct Panda: Codable {
    var description: String
    var imageUrl: URL?
    
    /* Panda() doesn't call a function because Panda isn't a function, but Swift is 'calling' the struct Panda to initialize a new instance of Panda with the description and the URL endpoint.*/
    static let defaultPanda = Panda(description: "Cute Panda",
                                    imageUrl: URL(string: "https://assets.devpubs.apple.com/playgrounds/_assets/pandas/pandaBuggingOut.jpg"))
}
struct PandaCollection: Codable {
    var sample: [Panda]
}
