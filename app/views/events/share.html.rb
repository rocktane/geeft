<div class="event card">

            <div class="event name"><%= @event.event_name  %></div>
            <div class="details">
              <div class="event event-lien_occasion">Pour: <%= @event.lien %>, à l'occasion de <%= @event.occasion %></div>
              <div class="event date">Date: <%= @event.event_date %></div>
              <div class="event description">Description: <%= @event.description %></div>
              <div class="event cagnotte">Cagnotte: <%= @event.cagnotte_url %></div>
            </div>

    <h1>Ma liste de geefts</h1>
    <% @event.list.each do |gift| %>
    <ul>
    <li><%= gift %></li>
    </ul>
    <% end %>

  </div>
