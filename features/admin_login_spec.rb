require File.dirname(__FILE__)+'/spec_helper'

feature '管理者TOPページログイン', js: true do

  scenario '管理者TOPページが正しく表示される' do
    visit '/admin'
    expect(page).to have_content('ユーザ管理システム')
    page.save_screenshot('./captures/case01.png')
  end

  scenario '正しいユーザ名とパスワードの組み合わせでログインできる' do
    visit '/admin'
    fill_in 'UserID', with: 'admin'
    fill_in 'Password', with: 'correct_password'

    click_on('ログイン')

    expect(page).to have_button('新規登録')
    page.save_screenshot('./captures/case02.png', full: true)
  end

  scenario '正しくないユーザ名とパスワードの組み合わせでログインできない' do
    visit '/admin'
    fill_in 'UserID', with: 'admin'
    fill_in 'Password', with: 'invalid_password'

    click_on('ログイン')

    expect(page).to have_content('ユーザー名またはパスワードが間違っています')
    page.save_screenshot('./captures/case03.png')
  end
end
    
