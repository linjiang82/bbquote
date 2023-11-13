//
//  CharacterView.swift
//  BB Quote
//
//  Created by Jiang Lin on 13/11/2023.
//

import SwiftUI

struct CharacterView: View {
  var show: String
  var character: Character
  var body: some View {
    GeometryReader{ geo in
      ZStack(alignment: .top){
        Image(show.lowerCasedAndNoSpace)
          .resizable()
          .scaledToFit()
        
        ScrollView{
          VStack{
            AsyncImage(url: character.images.randomElement()){image in
              image
                .resizable()
                .scaledToFill()
            } placeholder: {
              ProgressView()
            }
            
          }
          .frame(width: geo.size.width/1.2)
          .cornerRadius(25)
          .padding(.top, 60)
          
          VStack(alignment: .leading){
            Text(character.name)
              .font(.largeTitle)
            Text("Portrayed By: \(character.portrayedBy)")
              .font(.subheadline)
            
            Divider()
            
            Text("Character Info")
              .font(.title2)
            
            Text("Born: \(character.birthday)")
            
            Divider()
            
            Text("Occupations:")
            
            ForEach(character.occupations, id:\.self){occupation in
              Text("• \(occupation)")
                .font(.subheadline)
            }
            
            Divider()
            
            Text("Nicknames:")
            
            if(!character.aliases.isEmpty){
              ForEach(character.aliases, id:\.self){alias in
                Text("• \(alias)")
                  .font(.subheadline)
              }
            } else {
              Text("None")
            }
          }
          .padding([.leading, .bottom], 40)
          
        }
      }
      .frame(width: geo.size.width, height: geo.size.height)
    }
    .ignoresSafeArea()
  }
}

#Preview {
  CharacterView(show: Constants.BB, character: Constants.previewCharacter)
}
