# frozen_string_literal: true

When(/(?:.*) (should|should not) see the following text: (.*)/) do |should, text|
  if should == 'should'
    expect(page).to have_content(text)
  else
    expect(page).not_to have_content(text)
  end
end
