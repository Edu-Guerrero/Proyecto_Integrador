
# Distances and Similarities Explained

This document provides a quick explanation and formula for the distance and similarity metrics used in our analysis.

## 1. **Cosine Similarity**
- **Explanation**: Measures the cosine of the angle between two vectors in a multi-dimensional space. Values range from -1 (opposite direction) to 1 (same direction).
- **Formula**:
  
$$ \text{Cosine Similarity} = \frac{\vec{A} \cdot \vec{B}}{| \vec{A} | | \vec{B} |} $$

## 2. **Euclidean Distance**
- **Explanation**: Computes the straight-line (or Euclidean) distance between two points in a space.
- **Formula**:
  $$ d(\vec{A}, \vec{B}) = \sqrt{\sum_{i=1}^n (A_i - B_i)^2} $$

## 3. **Jaccard Similarity**
- **Explanation**: Measures the overlap between two sets. Used primarily for binary data.
- **Formula**:
  $$ J(A, B) = \frac{|A \cap B|}{|A \cup B|} $$

## 4. **Pearson Correlation**
- **Explanation**: Measures the linear correlation between two vectors. Values range from -1 (perfect negative correlation) to 1 (perfect positive correlation).
- **Formula**:
  $$ r = \frac{\sum_{i=1}^n (A_i - \bar{A})(B_i - \bar{B})}{\sqrt{\sum_{i=1}^n (A_i - \bar{A})^2 \sum_{i=1}^n (B_i - \bar{B})^2}} $$

## 5. **Manhattan Distance**
- **Explanation**: Measures the sum of the absolute differences between corresponding elements of two vectors.
- **Formula**:
  $$ d(\vec{A}, \vec{B}) = \sum_{i=1}^n |A_i - B_i| $$

## 6. **KL Divergence**
- **Explanation**: Measures how one probability distribution differs from a reference probability distribution.
- **Formula**:
  $$ D_{KL}(P | Q) = \sum_{i=1}^n P_i \log\left(\frac{P_i}{Q_i}\right) $$

## 7. **Hamming Distance**
- **Explanation**: Measures the proportion of positions at which the corresponding elements of two vectors are different (binary data).
- **Formula**:
  $$ D_{KL}(P | Q) = \sum_{i=1}^n P_i \log\left(\frac{P_i}{Q_i}\right) $$

## 8. **Bhattacharyya Distance**
- **Explanation**: Measures the similarity between two probability distributions.
- **Formula**:
  $$ D_B(P, Q) = -\log\left(\sum_{i=1}^n \sqrt{P_i Q_i}\right) $$

## 9. **Dot Product**
- **Explanation**: Measures the projection of one vector onto another.
- **Formula**:
  $$ \vec{A} \cdot \vec{B} = \sum_{i=1}^n A_i B_i $$