//
//  BookingSwiftUIView.swift
//  NIBM Parking
//
//  Created by Ruchira Wishwajith on 2021-11-18.
//

import SwiftUI
struct BookingSwiftUIView: View {
    @State var selectedSlot : [Int] = []
    @State var reservedSlots : [Int] = [3,10]
    @State var vipSlots : [Int] = [16,17,18,29]
    var body: some View {
        ScrollView(.vertical, showsIndicators: false, content:
                    {
                        HStack{
                            
                            Button(action: {}, label:
                                    {
                                        Image(systemName: "chevron.left").font(.title2)
                                            . foregroundColor(.black)
                                    })
                            Spacer()
                        }
                        .overlay(
                            
                        Text("Select a Parking Spot")
                            .font(.title2)
                            .foregroundColor(.blue)
                        .fontWeight(.semibold)
                        )
                        .padding()
                        
                        //Parking Spot Slots
                        //Total Slots = 30
                        //VIP Slots = 5
                        //Fake Slots = 4
                        
                        let totalParkingSlots = 30 + 4
                        let leftSideSlots = 0..<totalParkingSlots/2
                        let rightSideSlots = totalParkingSlots/2..<totalParkingSlots
                        HStack(spacing: 30)
                            {
                            let columns = Array(repeating: GridItem(.flexible(), spacing:10), count: 4)
                            LazyVGrid(columns: columns, spacing: 13, content: {
                                ForEach(leftSideSlots,id: \.self)
                                    {index in
                                    //Get Correct Parking Slot
                                    let slot = index >= 12 ? index - 1 : index
                                    SlotView(index: index, slot: slot, selectedSlot: $selectedSlot, reservedSlots: $reservedSlots, vipSlots: $vipSlots)
                                        .contentShape(Rectangle())
                                        .onTapGesture {
                                            if selectedSlot.contains(slot)
                                            {
                                                //remove
                                                selectedSlot.removeAll {(removeSlot) ->Bool in
                                                    return removeSlot == slot
                                                }
                                                return
                                            }
                                            //adding
                                            selectedSlot.append(slot)
                                            
                                        }
                                        //disable if the slot is booked
                                        .disabled(reservedSlots.contains(slot))
                                    
                                }
                            })
                            let columns = Array(repeating: GridItem(.flexible(), spacing:10), count: 4)
                            LazyVGrid(columns: columns, spacing: 13, content: {
                                ForEach(rightSideSlots,id: \.self)
                                    {
                                    index in
                                    let slot = index >= 23 ? index - 2 : index - 1
                                    SlotView(index: index, slot: slot, selectedSlot: $selectedSlot, reservedSlots: $reservedSlots, vipSlots: $vipSlots)
                                        .contentShape(Rectangle())
                                        .onTapGesture {
                                            
                                            //check if the slot is selected
                                            if selectedSlot.contains(slot)
                                            {
                                                //remove
                                                selectedSlot.removeAll {(removeSlot) ->Bool in
                                                    return removeSlot == slot
                                                }
                                                return
                                            }
                                            //adding
                                            selectedSlot.append(slot)
                                            
                                        }
                                        //disable if the slot is booked
                                        .disabled(reservedSlots.contains(slot))
                                }
                            })
                        }
                        .padding()
                        .padding(.top,30)
                        
                        //Legend of the indicatord
                        HStack(spacing: 15)
                            {
                            RoundedRectangle(cornerRadius: 4)
                                .stroke(Color.gray)
                                .frame(width: 20, height: 20)
                                .overlay(
                                    Image(systemName:"xmark")
                                        .font(.caption)
                                        .foregroundColor(.green)
                                )
                            Text("Reserved")
                                .font(.caption)
                                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                            
                            RoundedRectangle(cornerRadius: 4)
                                .stroke(Color.blue)
                                .frame(width: 20, height: 20)
                                .overlay(
                                    Image(systemName:"star.fill")
                                        .font(.caption)
                                        .foregroundColor(.yellow))
                            Text("VIP")
                                .font(.caption)
                                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                            
                            RoundedRectangle(cornerRadius: 4)
                                .stroke(Color.blue)
                                .frame(width: 20, height: 20)
                            
                            Text("Available")
                                .font(.caption)
                                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                            
                            RoundedRectangle(cornerRadius: 4)
                                .fill(Color.blue)
                                .frame(width: 20, height: 20)
                            
                            Text("Selected")
                                .font(.caption)
                                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                            
                        }
                        .padding(.top,20)
                    })
            .background(Color(.white).ignoresSafeArea())
    }
}

struct SlotView: View
{
    var index: Int
    var slot: Int
    
    @Binding var selectedSlot: [Int]
    @Binding var reservedSlots: [Int]
    @Binding var vipSlots: [Int]
    
    var body: some View
    {
        ZStack{
            RoundedRectangle(cornerRadius: 6)
                .stroke(reservedSlots.contains(slot) ? Color.red : Color(.black),lineWidth: 2)
                .frame(height: 30)
                .background(
                    selectedSlot.contains(slot) ? Color(.systemBlue) : Color.clear
                )
            //Hide the fake ones
                .opacity(index == 0 || index == 13 || index == 16 || index == 20 || index == 32 ?0 : 1)
            if reservedSlots.contains(slot)
            {
                Image(systemName: "xmark")
                    .foregroundColor(.gray)
            }
            if vipSlots.contains(slot)
            {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            }
        }
      
    }
}

struct BookingSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        BookingSwiftUIView()
    }
}
