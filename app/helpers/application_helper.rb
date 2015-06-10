module ApplicationHelper
  # Returns the full title on a per-page basis.
  # page_title - просто входной параметр
  def full_title(page_title)
    base_title = "Примерчик заголовка странички приклада"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end
  
end
