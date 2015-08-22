require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest

  test 'layout links' do
    get root_path
    assert_template 'static_pages/home'
    assert_select "a[href=?]", root_path, count: 2
    assert_select "a[href=?]", controller: "static_pages", action: "help"
    assert_select "a[href=?]", controller: "static_pages", action: "about"
    assert_select "a[href=?]", controller: "static_pages", action: "contact"

  end
end
