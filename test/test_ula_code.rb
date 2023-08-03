require "test/unit"

class TestSample < Test::Unit::TestCase

    sub_test_case "Foo context" do
        
    end
    
    class << self

        # テスト群の実行前に呼ばれる。変な初期化トリックがいらなくなる
        def startup
            p :_startup
        end
        
        # テスト群の実行後に呼ばれる
        def shutdown
            p :_shutdown
        end
    end

    def test_foo
        p 'test_foo'
        assert_true(1 == 1)
    end

    def test_number
        p 'Number-----'
        assert_match(/\d+/, 'five744, four, seven')
        assert_no_match(/two/, 'one 2 three', 'aaaaaaaaNumber')   # -> pass
        assert_no_match(/three/, 'one 2 , thre') # -> fail

    end

    # def
    # end

    def test_aaa
        p 'aaa'
    end

    # 毎回テスト実行前に呼ばれる
    def setup
        p :setup
    end
    
    # テストがpassedになっている場合に、テスト実行後に呼ばれる。テスト後の状態確認とかに使える。
    def cleanup
        p :cleanup
    end
    
    # 毎回テスト実行後に呼ばれる
    def teardown
        p :teardown
    end

    def test_bar
        p 'test_bar'
        assert_equal(1, 1)
    end

    def test_upcase
        p 'upcase1'
        assert_equal('MY STRING', 'my string'.upcase)
    end

    def test_uipcase
        p 'upcase2'
        assert_equal 'MY STRING'.downcase, 'my string'
    end
end


# class Sample
#     def self.greeting
#         'Hello. world!'
#     end
# end

# class TestSample < Test::Unit::TestCase
#     def test_greeting
#         assert_equal 'Hello, world!', Sample.greeting
#     end
# end





