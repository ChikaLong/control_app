module FoodsHelper
  def btn_text
    if action_name == "index"
      "登録"
    elsif action_name == "edit"
      "修正"
    end
  end
end
