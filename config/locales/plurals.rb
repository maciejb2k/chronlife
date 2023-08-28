{:pl =>
  { :i18n =>
    { :plural =>
      { :keys => [:one, :few, :other],
        :rule => lambda { |n|
          if n == 1
            :one
          else
            if [2, 3, 4].include?(n)
              :few
            else
              :other
            end
          end
        }
      }
    }
  }
}
