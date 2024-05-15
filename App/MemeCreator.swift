/*
See the License.txt file for this sample’s licensing information.
*/

import SwiftUI

/* Create the MemeCreator View and make it Sendable */
struct MemeCreator: View, Sendable {
    /* Establish a stateful element that can be passed around */
    @EnvironmentObject var fetcher: PandaCollectionFetcher
    /* Create simple, private variables  */
    @State private var memeText = ""
    @State private var textSize = 60.0
    @State private var textColor = Color.white
    /* State wrapper for when the focus is changed */
    @FocusState private var isFocused: Bool

    /* Create a view and applies it to the body variable, which is not private */
    var body: some View {
        /* Vertical Stack of elements */
        VStack(alignment: .center) {
            /* Places spaced between elements */
            Spacer()
            /* Calls LoadableImage that's declared in LoadableImage view */
            LoadableImage(imageMetadata: fetcher.currentPanda)
                .overlay(alignment: .bottom) {
                    TextField(
                        "Meme Text",
                        text: $memeText,
                        prompt: Text("")
                    )
                    .focused($isFocused)
                    .font(.system(size: textSize, weight: .heavy))
                    .shadow(radius: 10)
                    .foregroundColor(textColor)
                    .padding()
                    .multilineTextAlignment(.center)
                }
                .frame(minHeight: 150)

            Spacer()
            /* Checks to see if it's empty */
            if !memeText.isEmpty {
                VStack {
                    HStack {
                        Text("Font Size")
                            .fontWeight(.semibold)
                        Slider(value: $textSize, in: 20...140)
                    }
                    
                    HStack {
                        Text("Font Color")
                            .fontWeight(.semibold)
                        ColorPicker("Font Color", selection: $textColor)
                            .labelsHidden()
                            .frame(width: 124, height: 23, alignment: .leading)
                        Spacer()
                    }
                }
                .padding(.vertical)
                .frame(maxWidth: 325)
                
            }

            HStack {
                Button {
                    if let randomImage = fetcher.imageData.sample.randomElement() {
                        fetcher.currentPanda = randomImage
                    }
                } label: {
                    VStack {
                        Image(systemName: "photo.on.rectangle.angled")
                            .font(.largeTitle)
                            .padding(.bottom, 4)
                        Text("Shuffle Photo")
                    }
                    .frame(maxWidth: 180, maxHeight: .infinity)
                }
                .buttonStyle(.bordered)
                .controlSize(.large)

                Button {
                    isFocused = true
                } label: {
                    VStack {
                        Image(systemName: "textformat")
                            .font(.largeTitle)
                            .padding(.bottom, 4)
                        Text("Add Text")
                    }
                    .frame(maxWidth: 180, maxHeight: .infinity)
                }
                .buttonStyle(.bordered)
                .controlSize(.large)
            }
            .fixedSize(horizontal: false, vertical: true)
            .frame(maxHeight: 180, alignment: .center)
        }
        .padding()
        .task {
            try? await fetcher.fetchData()
        }
        .navigationTitle("Meme Creator")
    }
}
