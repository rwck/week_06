require 'pp'

mystring = " Prefix Verb   URI Pattern                    Controller#Action
                  issues GET    /issues(.:format)              issues#index
                         POST   /issues(.:format)              issues#create
               new_issue GET    /issues/new(.:format)          issues#new
              edit_issue GET    /issues/:id/edit(.:format)     issues#edit
                   issue GET    /issues/:id(.:format)          issues#show
                         PATCH  /issues/:id(.:format)          issues#update
                         PUT    /issues/:id(.:format)          issues#update
                         DELETE /issues/:id(.:format)          issues#destroy
                projects GET    /projects(.:format)            projects#index
                         POST   /projects(.:format)            projects#create
             new_project GET    /projects/new(.:format)        projects#new
            edit_project GET    /projects/:id/edit(.:format)   projects#edit
                 project GET    /projects/:id(.:format)        projects#show
                         PATCH  /projects/:id(.:format)        projects#update
                         PUT    /projects/:id(.:format)        projects#update
                         DELETE /projects/:id(.:format)        projects#destroy
        new_user_session GET    /users/sign_in(.:format)       devise/sessions#new
            user_session POST   /users/sign_in(.:format)       devise/sessions#create
    destroy_user_session DELETE /users/sign_out(.:format)      devise/sessions#destroy
           user_password POST   /users/password(.:format)      devise/passwords#create
       new_user_password GET    /users/password/new(.:format)  devise/passwords#new
      edit_user_password GET    /users/password/edit(.:format) devise/passwords#edit
                         PATCH  /users/password(.:format)      devise/passwords#update
                         PUT    /users/password(.:format)      devise/passwords#update
cancel_user_registration GET    /users/cancel(.:format)        devise/registrations#cancel
       user_registration POST   /users(.:format)               devise/registrations#create
   new_user_registration GET    /users/sign_up(.:format)       devise/registrations#new
  edit_user_registration GET    /users/edit(.:format)          devise/registrations#edit
                         PATCH  /users(.:format)               devise/registrations#update
                         PUT    /users(.:format)               devise/registrations#update
                         DELETE /users(.:format)               devise/registrations#destroy
                   users GET    /users(.:format)               users#index
                         POST   /users(.:format)               users#create
                new_user GET    /users/new(.:format)           users#new
               edit_user GET    /users/:id/edit(.:format)      users#edit
                    user GET    /users/:id(.:format)           users#show
                         PATCH  /users/:id(.:format)           users#update
                         PUT    /users/:id(.:format)           users#update
                         DELETE /users/:id(.:format)           users#destroy
                    root GET    /                              users#index "

puts mystring

my_array = mystring.split(' ')

puts my_array
pp my_array

my_array.each do |word|
  pp word
end

# my_array.each_with_index {| word, index | puts "#{word} => #{index}"}
#
# my_array.each do | word |
#   if word.start_with?("/")
#     my_array.delete(word)
#   end
#   if word.include?("/")
#     my_array.delete(word)
#   end
# end
# puts my_array

words = %w(DELETE
           PUT
           PATCH
           GET
           POST
           URI
           Verb
           Prefix
           /
           #)

# my_array.delete_if { | word | word.include?("/") || word.include?("#") }

# puts words

# words.each do |word|
#   puts word
#   # my_array.delete_if { |blob| blob.include?(word) }
#   my_array.delete_if do | doo |
#     doo.include?(word)
#   end
# end

my_array.delete_if { |a| a.include?('#') }
my_array.delete_if { |a| a.include?('/') }

words.each do |word|
  my_array.delete_if { |b| b.include?(word) }
end

my_array.delete_if { |x| words.include?(x) }
pp words
pp my_array

my_array.each do |word|
  word.insert(0, "link_to #{word} ")
end

puts my_array

# my_array.delete_if { | word | word.include?(words)}

# my_array.delete_if do | word |
#   words.each do | w |
#     word.include?(w)
#   end
# end

# puts my_array
