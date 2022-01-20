module UsersHelper
  def btn_user
    if action_name == "new"
      "新規登録"
    elsif action_name == "edit"
      "変更"
    end
  end
end
