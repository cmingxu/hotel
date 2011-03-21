module Admin::ArticlesHelper
  def display_article_state(state)
   return case state
    when "published"
      "发布"
    when "hide"
      "隐藏"
    end
  end
end
