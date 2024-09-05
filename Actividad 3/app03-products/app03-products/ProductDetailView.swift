//
//  ProdcutDetailView.swift
//  app03-products
//
//  Created by Jorge on 03/09/24.
//

import SwiftUI

struct ProductDetailView: View {
    
    @Environment(ProductsModel.self) var productsModel
    @Environment(\.dismiss) var dismiss
    
    var mode: Mode = .add
    @State var product: Product = Product.defaultProduct
    
    var body: some View {
        VStack {
            Form {
                Section(mode == .add ? "Agregar Producto" : "Actualizar Producto") {
                    Text("Id del producto")
                        .font(.caption)
                    TextField("Product Id", text: $product.productId)
                        .textFieldStyle(.roundedBorder)
                    Text("Nombre del producto")
                        .font(.caption)
                    TextField("Product Name", text: $product.productName)
                        .textFieldStyle(.roundedBorder)
                }
            }
            Button {
                if mode == .add {
                    print("Agrega")
                    Task {
                        await productsModel.addProduct(product: product)
                    }
                } else {
                    print("actualiza")
                    Task {
                        await productsModel.updateProduct(product: product)
                    }
                }
                dismiss()
            } label: {
                Text(mode == .add ? "Agregar" : "Actualizar")
            }
        }
    }
}

#Preview {
    ProductDetailView()
        .environment(ProductsModel())
}
