require 'spec_helper'

feature 'Deleting Tickets' do
	let!(:project) { FactoryGirl.create(:project) }
	let!(:ticket) { FactoryGirl.create(:ticket, project: project) }

	before do
		visit '/'
		click_link project.name
		click_link ticket.title
	end

	scenario 'Deleting a tickect' do
		# fill_in 'Title', with: 'Make it really shiny!'
		click_link 'Delete Ticket'

		expect(page).to have_content 'Ticket has been deleted.'
		expect(page.current_url).to eq(project_url(project))
	end

	# scenario 'Updating a ticket with invalid data' do
	# 	fill_in 'Title', with: ''
	# 	click_button 'Update Ticket'

	# 	expect(page).to have_content('Ticket has not been updated.')
	# end


end