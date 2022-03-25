class Company < ActiveRecord::Base
    has_many :freebies
    has_many :devs, through: :freebies

    def give_freebie(dev, item_name, value)
        Freebie.create(dev_id: dev, item_name: item_name, value: value, company: self )
    end
    def self.oldest_company
        self.all.order(:founding_year).first
    end
end
