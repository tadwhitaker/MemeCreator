/*
See the License.txt file for this sample’s licensing information.
*/

/* The PandaCollectionFetcher called in MemeCreatorApp, fetches data using PandaCollection and the response data is stored in the MemeCreatorApp state in a 'fetcher' variable.*/
import SwiftUI

class PandaCollectionFetcher: ObservableObject {
    /* Wrappers and variables for data*/
    @Published var imageData = PandaCollection(sample: [Panda.defaultPanda])
    @Published var currentPanda = Panda.defaultPanda
    
    let urlString = "http://playgrounds-cdn.apple.com/assets/pandaData.json"
    
    enum FetchError: Error {
        case badRequest
        case badJSON
    }
    
     func fetchData() async 
     throws  {
        guard let url = URL(string: urlString) else { return }

        let (data, response) = try await URLSession.shared.data(for: URLRequest(url: url))
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { throw FetchError.badRequest }

        Task { @MainActor in
            imageData = try JSONDecoder().decode(PandaCollection.self, from: data)
        }
    }
    
}
