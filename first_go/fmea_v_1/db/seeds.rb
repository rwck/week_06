User.create!([
  {email: "blob@blob.blob", picture: "http://www.theage.com.au/content/dam/images/g/j/n/6/c/r/image.related.articleLeadNarrow.300x0.gjmv1w.png/1442890478901.jpg", phone: "", firstname: "Malcolm", lastname: "Turnbull", full_name: nil, encrypted_password: "$2a$10$1a1p4gW7v3G4oHvwrNQHk.bxVvF0yAxqVEiF7HnxUiNMknzUn4DjO", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 2, current_sign_in_at: "2015-11-04 00:47:03", last_sign_in_at: "2015-11-03 22:53:30", current_sign_in_ip: "::1", last_sign_in_ip: "::1", admin: false},
  {email: "a@a.com", picture: "https://www.themonthly.com.au/sites/default/files/AbbottSquare.jpg", phone: "", firstname: "Tony", lastname: "Abbott", full_name: nil, encrypted_password: "$2a$10$PQxK3MoIbMNZCJO/Iy45QeUMysJVEaeEjaAVp1mV.8WPuGEUXYnTa", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 4, current_sign_in_at: "2015-11-04 02:03:48", last_sign_in_at: "2015-11-03 23:03:18", current_sign_in_ip: "::1", last_sign_in_ip: "::1", admin: false},
  {email: "rwckdw@gmail.com", picture: "http://ecx.images-amazon.com/images/I/41laHZoMs4L.jpg", phone: "", firstname: "Sarah", lastname: "Palin", full_name: nil, encrypted_password: "$2a$10$AaDwETiuBloxm8VCOKek8uwHFrhvP2eC7xcsl3ecbGzdAF2bRwG/K", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 4, current_sign_in_at: "2015-11-04 02:55:18", last_sign_in_at: "2015-11-04 01:45:54", current_sign_in_ip: "::1", last_sign_in_ip: "::1", admin: true}
])
Issue.create!([
  {item: "Test issue", function: "The springle is gabooshing too loudly", failure: "big", effect_of_failure: "bad", cause_of_failure: "stuff", current_controls: "none", recommended_actions: "Do more detailed frodule analysis", probability_estimate: 2, severity_estimate: 2, detection_indicators: 2, detection_dormancy_period: 2, risk_level: 8, further_investigation: "", project_id: 6},
  {item: "This is an issue", function: "", failure: "", effect_of_failure: "", cause_of_failure: "", current_controls: "", recommended_actions: "", probability_estimate: nil, severity_estimate: nil, detection_indicators: nil, detection_dormancy_period: nil, risk_level: nil, further_investigation: "", project_id: 3}
])
Project.create!([
  {name: "Another first project", user_id: 2},
  {name: "Blob project", user_id: 1},
  {name: "", user_id: 2},
  {name: "", user_id: 2},
  {name: "Malcolm's first project", user_id: 4}
])
