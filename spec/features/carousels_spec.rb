require 'rails_helper'

RSpec.feature 'Carousels', type: :feature, js: true do
  before do
    visit root_path
  end

  it 'prompts user with toast when scrolled to carousel' do
    # scroll halfway through the carousel
    page.execute_script '$(window).scrollTop($(".carousel").offset().top +'\
                        '$(".carousel").height() / 2)'
    expect(page).to have_css '.toast'
  end

  it "doesn't show toast when not scrolled down to carousel" do
    # scroll 100px down
    page.execute_script '$(window).scrollTop(100)'
    expect(page).to_not have_css '.toast'
  end

  it 'switches image in car using arrow keys' do
    first_car_z_index = lambda do
      page.evaluate_script('$(".carousel-item").first().css("z-index")')
    end
    expect(first_car_z_index.call).to eq '0'
    page.find('body').send_keys :right
    # wait for animation
    sleep 0.3
    expect(first_car_z_index.call).to_not eq '0'
    page.find('body').send_keys :left
    sleep 0.3
    expect(first_car_z_index.call).to eq '0'
  end
end
