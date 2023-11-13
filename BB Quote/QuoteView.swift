//
//  QuoteView.swift
//  BB Quote
//
//  Created by Jiang Lin on 12/11/2023.
//

import SwiftUI

struct QuoteView: View {
  let show: String
  @State var showCharacter = false
  @StateObject var viewModel = ViewModel(controller: FetchController())
  var body: some View {
    GeometryReader { geo in
      ZStack{
        Image(show.lowerCasedAndNoSpace)
          .resizable()
          .frame(width: geo.size.width*2.7, height: geo.size.height*1.2)
        VStack {
          VStack{
            switch viewModel.status {
            case .fetching:
              ProgressView()
            case .success(let data):
              Spacer(minLength: 140)
              Text(data.quote.quote)
                .minimumScaleFactor(0.5)
                .multilineTextAlignment(.center)
                .foregroundStyle(.white)
                .padding()
                .background(.black.opacity(0.5))
                .cornerRadius(25)
                .padding(.horizontal)
              Spacer()
              ZStack(alignment: .bottom) {
                AsyncImage(url: data.character.images[0]) { image in
                  image
                    .resizable()
                    .scaledToFill()
                } placeholder: {
                  ProgressView()
                }
                .frame(width: geo.size.width/1.1, height: geo.size.height/1.8)
                .onTapGesture {
                  showCharacter.toggle()
                }
                .sheet(isPresented: $showCharacter, content: {
                  CharacterView(show: show, character: data.character)
                })
                Text(data.character.name)
                  .foregroundStyle(.white)
                  .padding(10)
                  .frame(maxWidth: .infinity)
                  .background(.ultraThinMaterial.opacity(0.5))
              }
              .frame(width: geo.size.width/1.1, height: geo.size.height/1.8)
              .cornerRadius(80)
              
            default:
              EmptyView()
            }
          }
          .frame(width: geo.size.width, height: geo.size.height/1.2)
          Spacer()
          Button(action: {
            Task{
              await viewModel.getData(for: show)
            }
          }, label: {
            
            Text("Get Random Quote")
              .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
              .foregroundStyle(.white)
              .padding()
              .background(Color("\(show.lowerCasedAndNoSpace)Background"))
              .cornerRadius(7)
              .shadow(color: Color("\(show.lowerCasedAndNoSpace)Shadow"), radius: 2 )
          })
          Spacer(minLength: 180)
        }
        .frame(width: geo.size.width, height: geo.size.height)
      }
      .frame(width: geo.size.width, height: geo.size.height)
    }
    .ignoresSafeArea()
  }}

#Preview {
  QuoteView(show: Constants.BB)
}
