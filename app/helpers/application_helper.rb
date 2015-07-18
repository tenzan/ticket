module ApplicationHelper
  def title(*parts)
    unless parts.empty?
      content_for :title do
        (parts << 'Ticketing System').join(' - ')
      end
    end
  end
end
