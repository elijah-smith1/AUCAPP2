//
//  EventsList.swift
//  AucTake1
//
//  Created by Elijah Smith on 5/19/23.
//

import SwiftUI

struct EventsListView: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 16) {
                ForEach(events) { event in
                    EventCard(event: event)
                }
            }
            .padding(.vertical, 16)
        }

    }
}

struct EventsListView_Previews: PreviewProvider {
    static var previews: some View {
        EventsListView()
    }
}
