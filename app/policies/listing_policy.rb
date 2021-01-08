class ListingPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    user.present?
  end

  def create?
    user.present? && (user.site_admin.present?)
  end

  def update?
    user.present? && ((record.user == user) || (user.site_admin.present?))
  end
end
