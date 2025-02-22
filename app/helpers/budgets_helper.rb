module BudgetsHelper
  def budget_budge_color(budget)
    case budget.category
    when 'expenditure'
      'danger'
    when 'income'
      'success'
    end
  end

  def sum_amounts(budgets)
    if budgets.any?
      budgets.map { |o| o.amount }.sum
    else
      0
    end
  end

  def sub_amounts(expenditude_budgets, income_budgets)
    sum_amounts(expenditude_budgets) - sum_amounts(income_budgets)
  end
end
