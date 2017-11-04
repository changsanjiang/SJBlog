class Article < ApplicationRecord
    has_many :comments, dependent: :destroy
    # 用于确保每篇文章都有标题, 并且标题长度不少于 5 个字符.
    validates :title, presence: true, length:{ minimum: 5 }
end
