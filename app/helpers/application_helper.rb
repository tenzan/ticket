module ApplicationHelper

  def admins_only(&block)
    block.call if current_user.try(:admin?)
  end

  def title(*parts)
    unless parts.empty?
      content_for :title do
        (parts << 'Ticketing System').join(' - ')
      end
    end
  end
end
