//
//  ContentView.swift
//  app03-products
//
//  Created by Jorge on 28/08/24.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(ProductsModel.self) var productsModel
    
    var body: some View {
        NavigationStack {
             VStack {
                VStack {
                    List {
                        ForEach(productsModel.products) { product in
                            NavigationLink {
                                ProductDetailView(mode: .edit, product: product)
                            } label: {
                                Text(product.productName)
                            }
                        }
                        .onDelete(perform: deleteProducts)
                    }
                    .listStyle(.inset)
                }
            }
             .navigationTitle("Products")
             .toolbar {
                 ToolbarItem(placement: .topBarTrailing) {
                     NavigationLink {
                         ProductDetailView(mode: .add)
                     } label: {
                         Image(systemName: "plus")
                             .font(.title2)
                             .foregroundStyle(Color.red)
                     }

                 }
             }
             .onAppear {
                 Task {
                     await productsModel.fetchProducts()
                 }
             }
        }
        .padding()
    }

    private func deleteProducts(offsets: IndexSet) {
        Task {
            for index in offsets {
                Task {}
                await productsModel.deleteProduct(product: productsModel.products[index])
            }
        }
    }
}

#Preview {
    ContentView()
        .environment(ProductsModel())
}
