require "lib/webrat"
require "lib/webrat/wang"

include Webrat

sess = WangSession.new
sess.visit "http://www.google.com/"
sess.fill_in "q", :with => "Webrat"
sess.click_button
sess.save_and_open_page
