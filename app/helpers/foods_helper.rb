module FoodsHelper
  def btn_text
    if (action_name == "index") || (action_name == "food_category_search") || (action_name == "item_category_search")
      "登録"
    elsif action_name == "edit"
      "修正"
    end
  end
end
