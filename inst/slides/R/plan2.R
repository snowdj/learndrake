plan <- drake_plan(
  rec = prepare_recipe(data),
  model = target(
    train_model(rec, act1 = act),
    format = "keras",
    transform = map(act = c("relu", "sigmoid", "softmax"))
  ),
  conf = target(
    confusion_matrix(data, rec, model),
    transform = map(model, .id = act)
  ),
  metrics = target(
    compare_models(conf),
    transform = combine(conf)
  ),
  data = read_csv(
    file_in("data/customer_churn.csv"),
    col_types = cols()
  ) %>%
    initial_split(prop = 0.3)
)
