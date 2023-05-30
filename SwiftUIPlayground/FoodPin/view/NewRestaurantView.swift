    //
//  NewRestaurantView.swift
//  SwiftUIPlayground
//
//  Created by Fu on 2023/5/17.
//

import SwiftUI

struct NewRestaurantView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.managedObjectContext) private var context
    @State private var showPhotoOptions = false
    @State private var photoSource: PhotoSource?
    @ObservedObject private var restaurantFormViewModel: RestaurantFormViewModel
    
    init() {
        let viewModel = RestaurantFormViewModel()
        viewModel.image = UIImage(named: "newphoto")!
        restaurantFormViewModel = viewModel
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                Image(uiImage: restaurantFormViewModel.image)
                    .resizable()
                    .scaledToFill()
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding([.leading, .trailing], 50)
                    .padding([.top, .bottom], 20)
                    .background(Color(.systemGray6))
                    .clipShape(RoundedRectangle(cornerRadius: 20.0))
                    .padding(.horizontal)
                    .onTapGesture {
                        self.showPhotoOptions.toggle()
                    }
                VStack {
                    FormTextField(
                        label: "NAME",
                        placeHolder: "Fill in the restaurant name",
                        value: $restaurantFormViewModel.name
                    )
                    FormTextField(
                        label: "TYPE",
                        placeHolder: "Fill in the restaurant type",
                        value: $restaurantFormViewModel.type
                    )
                    FormTextField(
                        label: "ADDRESS",
                        placeHolder: "Fill in the restaurant address",
                        value: $restaurantFormViewModel.location
                    )
                    FormTextField(
                        label: "PHONE",
                        placeHolder: "Fill in the restaurant phone",
                        value: $restaurantFormViewModel.phone
                    )
                    FormTextField(
                        label: "DESCRIPTION",
                        placeHolder: "Fill in the restaurant description",
                        value: $restaurantFormViewModel.description
                    )
                }
                .padding()
            }
            .navigationTitle("New Restaurant")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark")
                    }
                    .accentColor(.primary)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        save()
                        dismiss()
                    } label: {
                        Text("Save")
                            .font(.headline)
                            .foregroundColor(Color("NavigationBarTitle"))
                    }
                }
            }
        }
        .actionSheet(isPresented: $showPhotoOptions){
            ActionSheet(
                title: Text("Choose your photo source"),
                message: nil,
                buttons: [
                    .default(Text("Camera")) {
                        self.photoSource = .camera
                    },
                    .default(Text("Photo Library")) {
                        self.photoSource = .photoLibrary
                    },
                    .cancel()
                ]
            )
        }
        .fullScreenCover(item: $photoSource) { source in
            switch source {
                case .photoLibrary: ImagePicker(
                    sourceType: .photoLibrary,
                    selectedImage: $restaurantFormViewModel.image
                )
                .ignoresSafeArea()
                case .camera: ImagePicker(
                    sourceType: .camera,
                    selectedImage: $restaurantFormViewModel.image
                )
                .ignoresSafeArea()
            }
        }
    }
    
    private func save() {
        let restaurant = Restaurant(context: context)
        restaurant.name = restaurantFormViewModel.name
        restaurant.type = restaurantFormViewModel.type
        restaurant.location = restaurantFormViewModel.location
        restaurant.phone = restaurantFormViewModel.phone
        restaurant.summary = restaurantFormViewModel.description
        restaurant.image = restaurantFormViewModel.image.pngData()!
        restaurant.isFavorite = false
        
        do {
            try context.save()
        } catch {
            print(error.localizedDescription)
        }
    }
}

struct NewRestaurantView_Previews: PreviewProvider {
    static var previews: some View {
        NewRestaurantView()
    }
}
