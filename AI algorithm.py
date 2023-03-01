from keras.models import Sequential
from keras.layers import Dense

model = Sequential()
model.add(Dense(12, input_dim=8, activation='relu'))
model.add(Dense(8, activation='relu'))
model.add(Dense(1, activation='sigmoid'))
model.compile(loss='binary_crossentropy', optimizer='adam', metrics=['accuracy'])
model.fit(X_train, y_train, epochs=150, batch_size=10)
predictions = model.predict(X_test)


import tensorflow as tf

model = tf.keras.Sequential([
    tf.keras.layers.Dense(12, input_dim=8, activation='relu'),
    tf.keras.layers.Dense(8, activation='relu'),
    tf.keras.layers.Dense(1, activation='sigmoid')
])

model.compile(loss='binary_crossentropy', optimizer='adam', metrics=['accuracy'])
model.fit(X_train, y_train, epochs=150, batch_size=10)
predictions = model.predict(X_test)


import numpy as np

# Initialize Q-table with zeros
Q = np.zeros([num_states, num_actions])

# Set learning parameters
alpha = 0.1
gamma = 0.9
epsilon = 0.1

# Loop over episodes
for episode in range(num_episodes):
    # Reset environment and get initial state
    state = env.reset()
    done = False
    
    # Loop over time steps in current episode
    while not done:
        # Choose action based on epsilon-greedy policy
        if np.random.rand() < epsilon:
            action = env.action_space.sample()
        else:
            action = np.argmax(Q[state, :])
        
        # Take action and observe next state and reward
        next_state, reward, done, _ = env.step(action)
        
        # Update Q-value for current state-action pair
        Q[state, action] = Q[state, action] + alpha * (reward + gamma * np.max(Q[next_state, :]) - Q[state, action])
        
        # Update state
        state = next_state
