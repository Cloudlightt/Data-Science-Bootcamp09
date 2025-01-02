# Import Module

## Import model: Logistic Regression
from sklearn.linear_model import LogisticRegression

# Import module train_test_split
from sklearn.model_selection import train_test_split

# Import pandas
import pandas as pd

# Read csv data from Destop: churn
chrun = pd.read_csv("churn.csv")

chrun.head()

## Check missing value
chrun.isnull().sum()

## Change object to Category data type
chrun["churn"] = chrun["churn"].astype("category")

chrun.info()

# ML Workflow
## 4 Step: Split data > Train > Score > Evaluate

# Choose variable
y = chrun["churn"]
X = chrun[["accountlength", "numbercustomerservicecalls", "totaldaycharge", "totaldayminutes", "totalevecalls", "totalevecharge", "totalnightcalls"]]

# 1.Split data
X_train, X_test, y_train, y_test = train_test_split(
    # Test size 20%
    # Random_state = set.seed
    X, y, test_size = 0.20, random_state = 42
)

# 2.Train model
model = LogisticRegression()
model.fit(X_train, y_train) # Model fitting

# 3. Score
train_error = model.score(X_train, y_train)

# 4. Evaluate
test_error = model.score(X_test, y_test)

print(train_error, test_error)
