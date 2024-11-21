require "rails_helper"

describe "movies/show.html.erb" do

  let!(:movie) { Movie.create(title: "E", description: "EE", created_at: 1.day.ago, updated_at: 0.day.ago) }

  it "uses time_ago_in_words for created_at" do
    assign(:the_movie, movie)
    allow(view).to receive(:time_ago_in_words)
    render
    expect(view).to have_received(:time_ago_in_words).with(movie.created_at)
  end

  it "uses link_to for edit link" do
    assign(:the_movie, movie)
    allow(view).to receive(:link_to)
    render
    expect(view).to have_received(:link_to).with("Edit movie", "/movies/#{movie.id}/edit")
  end
end
