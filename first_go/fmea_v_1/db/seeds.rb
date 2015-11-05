User.create!([
  {email: "blob@blob.blob", picture: "http://www.theage.com.au/content/dam/images/g/j/n/6/c/r/image.related.articleLeadNarrow.300x0.gjmv1w.png/1442890478901.jpg", phone: "asas", firstname: "Malcolm", lastname: "Turnbull", full_name: nil, password: "a", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 4, current_sign_in_at: "2015-11-04 14:21:17", last_sign_in_at: "2015-11-04 13:45:23", current_sign_in_ip: "::1", last_sign_in_ip: "::1", admin: false},
  {email: "a@a.com", picture: "https://www.themonthly.com.au/sites/default/files/AbbottSquare.jpg", phone: "444", firstname: "Tony", lastname: "Abbott", full_name: nil, password: "a", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 15, current_sign_in_at: "2015-11-05 22:12:28", last_sign_in_at: "2015-11-04 14:47:37", current_sign_in_ip: "::1", last_sign_in_ip: "::1", admin: false},
  {email: "b@b.com", picture: "http://ecx.images-amazon.com/images/I/41laHZoMs4L.jpg", phone: "", firstname: "Sarah", lastname: "Palin", full_name: nil, password: "a", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 28, current_sign_in_at: "2015-11-05 22:16:43", last_sign_in_at: "2015-11-05 22:12:08", current_sign_in_ip: "::1", last_sign_in_ip: "::1", admin: true},
  {email: "barr@cooda.com", picture: "http://images.clipartpanda.com/barracuda-20clip-20art-Baracuda-temporary-tattoo.jpg", phone: "", firstname: "Barra", lastname: "Yarra", full_name: nil, password: "a", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2015-11-05 04:22:03", last_sign_in_at: "2015-11-05 04:22:03", current_sign_in_ip: "::1", last_sign_in_ip: "::1", admin: false},
  {email: "goofy@goofy.com", picture: "http://www.cliparthut.com/clip-arts/185/disney-goofy-face-clip-art-185451.png", phone: "", firstname: "Goofy", lastname: "Doofy", full_name: nil, password: "a", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 2, current_sign_in_at: "2015-11-05 22:42:13", last_sign_in_at: "2015-11-04 10:45:22", current_sign_in_ip: "::1", last_sign_in_ip: "::1", admin: false}
])
Project.create!([
  {name: "Sarah's project", user_id: 1},
  {name: "Bob", user_id: 1},
  {name: "", user_id: 1},
  {name: "", user_id: 1},
  {name: "", user_id: 1},
  {name: "asdfasdf", user_id: 1},
  {name: "", user_id: 1},
  {name: "gazebo", user_id: 2},
  {name: "yaroo", user_id: 2},
  {name: "bazoo", user_id: 2}
])
Issue.create!([
  {item: "Issue one", function: "The springle is gabooshing too loudly", failure: "blob not blobbing fast enough", effect_of_failure: "broken springle", cause_of_failure: "Not putting in enough frodules", current_controls: "None", recommended_actions: "Do more detailed frodule analysis", probability_estimate: 2, severity_estimate: 3, detection_indicators: 0, detection_dormancy_period: 2, risk_level: 0, further_investigation: "Yes please", project_id: 1},
  {item: "Hello", function: "The springle is gabooshing too loudly", failure: "blob not blobbing fast enough", effect_of_failure: "broken springle", cause_of_failure: "Not putting in enough frodules", current_controls: "None", recommended_actions: "Do more detailed frodule analysis", probability_estimate: 1, severity_estimate: 1, detection_indicators: 1, detection_dormancy_period: 1, risk_level: 1, further_investigation: "Yes please", project_id: 1}
])
