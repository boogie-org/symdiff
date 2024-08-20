using System;
using System.Collections;
using System.Linq;

namespace SymDiff.source;

using System.Collections.Generic;

/// <summary>
/// A bijective (one-to-one) dictionary.
/// </summary>
public class BiDictionary<TKey, TValue> : IEnumerable<KeyValuePair<TKey, TValue>>
{
    private Dictionary<TKey, TValue> keyToValue;
    private Dictionary<TValue, TKey> valueToKey;

    public BiDictionary()
    {
        keyToValue = new Dictionary<TKey, TValue>();
        valueToKey = new Dictionary<TValue, TKey>();
    }

    public BiDictionary(BiDictionary<TKey, TValue> other)
    {
        keyToValue = new Dictionary<TKey, TValue>(other.keyToValue);
        valueToKey = new Dictionary<TValue, TKey>(other.valueToKey);
    }
    
    public BiDictionary(Dictionary<TKey, TValue> other)
    {
        keyToValue = new Dictionary<TKey, TValue>(other);
        valueToKey = new Dictionary<TValue, TKey>();

        if (other.Values.Distinct().Count() != other.Count)
        {
            throw new ArgumentException("Values must be unique for a bijective mapping.");
        }

        foreach (var pair in other)
        {
            valueToKey.Add(pair.Value, pair.Key);
        }
    }

    public bool TryAdd(TKey key, TValue value)
    {
        if (keyToValue.ContainsKey(key) || valueToKey.ContainsKey(value))
        {
            return false;
        }

        Add(key, value);
        return true;
    }

    public void Add(TKey key, TValue value)
    {
        if (keyToValue.ContainsKey(key))
        {
            throw new ArgumentException($"The key already exists: ({key}, {keyToValue[key]})." +
                                        $"Tried to add ({key}, {value})");
        }

        if (valueToKey.ContainsKey(value))
        {
            throw new ArgumentException($"The value already exists: ({valueToKey[value]}, {value})." +
                                        $"Tried to add ({key}, {value})");
        }

        keyToValue[key] = value;
        valueToKey[value] = key;
    }

    /// <summary>
    /// Returns true if either the key or the value is matched with a conflicting other.
    /// Returns false if there is no conflict, or if the pair does not exist in the map.
    /// </summary>
    public bool HasConflict(TKey key, TValue value)
    {
        var hasKey = keyToValue.TryGetValue(key, out TValue existingValue);
        var hasValue = valueToKey.TryGetValue(value, out TKey existingKey);

        if (hasKey && !EqualityComparer<TValue>.Default.Equals(value, existingValue))
        {
            return true;
        }

        if (hasValue && !EqualityComparer<TKey>.Default.Equals(key, existingKey))
        {
            return true;
        }

        return false;
    }
    
    /// <summary>
    /// Update the map if the key/value does not exist with a conflicting
    /// value/key. Returns false if there was a conflict, true otherwise.
    /// </summary>
    public bool TryAddIfNoConflict(TKey key, TValue value)
    {
        if (HasConflict(key, value))
        {
            return false;
        }

        // No conflict. The update might be redundant but it is safe.
        keyToValue[key] = value;
        valueToKey[value] = key;
        return true;
    }

    public TValue GetValueByKey(TKey key)
    {
        if (!keyToValue.TryGetValue(key, out TValue value))
        {
            throw new KeyNotFoundException($"The given key '{key}' was not present in the dictionary.");
        }
        return value;
    }

    public TKey GetKeyByValue(TValue value)
    {
        if (!valueToKey.TryGetValue(value, out TKey key))
        {
            throw new KeyNotFoundException($"The given value '{value}' was not present in the dictionary.");
        }
        return key;
    }

    public bool TryGetValueByKey(TKey key, out TValue value)
    {
        return keyToValue.TryGetValue(key, out value);
    }

    public bool TryGetKeyByValue(TValue value, out TKey key)
    {
        return valueToKey.TryGetValue(value, out key);
    }

    public bool RemoveByKey(TKey key)
    {
        if (!keyToValue.TryGetValue(key, out var value))
        {
            return false;
        }

        keyToValue.Remove(key);
        valueToKey.Remove(value);
        return true;
    }

    public bool RemoveByValue(TValue value)
    {
        if (!valueToKey.TryGetValue(value, out var key))
        {
            return false;
        }

        valueToKey.Remove(value);
        keyToValue.Remove(key);
        return true;
    }

    public bool ContainsKey(TKey key)
    {
        return keyToValue.ContainsKey(key);
    }

    public bool ContainsValue(TValue value)
    {
        return valueToKey.ContainsKey(value);
    }

    public void Clear()
    {
        keyToValue.Clear();
        valueToKey.Clear();
    }
    
    public Dictionary<TKey, TValue>.KeyCollection Keys => keyToValue.Keys;
    
    public Dictionary<TKey, TValue>.ValueCollection Values => keyToValue.Values;

    public IEnumerator<KeyValuePair<TKey, TValue>> GetEnumerator()
    {
        return keyToValue.GetEnumerator();
    }

    IEnumerator IEnumerable.GetEnumerator()
    {
        return GetEnumerator();
    }
}
