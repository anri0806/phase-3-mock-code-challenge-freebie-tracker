class Dev < ActiveRecord::Base
    has_many :freebies
    has_many :companies, through: :freebies

    def received_one?(item_name)
        #  This does find if dev received given 
        #  item but doesnt return boolean
        #self.freebies.find_by(item_name: item_name)

        self.freebies.any? do |r|
            r.item_name == item_name
        end
    end

    def give_away(dev, freebie)
        if freebie.dev != self
        freebie.dev = dev
        end

        #freebie.update(dev: dev) unless freebie.dev != self
    end

end
