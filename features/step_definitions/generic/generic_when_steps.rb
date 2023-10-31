# frozen_string_literal: true

When(/(?:.*) (?:visit|visits) the (.*) page/) do |page_name|
  path = case page_name
         when 'sign up'
           new_user_registration_path
         end

  path ||= edit_show_visit(page_name)

  visit path
end

When(/(?:.*) fill the (.*) field with (.*)/) do |input_label, data|
  find_field(input_label, with: '').set(data)
end

When(/(?:.*) submit form/) do
  find("input[type='submit']").click
end

When(/byebug/) do
  binding.irb # rubocop:disable Lint/Debugger
end
