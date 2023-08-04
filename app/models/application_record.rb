class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  def update_with_context(new_attributes, context)
    with_transaction_returning_status do
      assign_attributes(new_attributes)
      save(context:)
    end
  end
end
